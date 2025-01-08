//
//  lock2LiveActivity.swift
//  lock2
//
//  Created by Emmanuel Ortigoza Bordón on 2024-09-17.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct lock2Attributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct lock2LiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: lock2Attributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension lock2Attributes {
    fileprivate static var preview: lock2Attributes {
        lock2Attributes(name: "World")
    }
}

extension lock2Attributes.ContentState {
    fileprivate static var smiley: lock2Attributes.ContentState {
        lock2Attributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: lock2Attributes.ContentState {
         lock2Attributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: lock2Attributes.preview) {
   lock2LiveActivity()
} contentStates: {
    lock2Attributes.ContentState.smiley
    lock2Attributes.ContentState.starEyes
}
