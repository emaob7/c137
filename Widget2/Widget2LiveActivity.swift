//
//  Widget2LiveActivity.swift
//  Widget2
//
//  Created by Emmanuel Ortigoza Bordón on 2024-08-15.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Widget2Attributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct Widget2LiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Widget2Attributes.self) { context in
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

extension Widget2Attributes {
    fileprivate static var preview: Widget2Attributes {
        Widget2Attributes(name: "World")
    }
}

extension Widget2Attributes.ContentState {
    fileprivate static var smiley: Widget2Attributes.ContentState {
        Widget2Attributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: Widget2Attributes.ContentState {
         Widget2Attributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: Widget2Attributes.preview) {
   Widget2LiveActivity()
} contentStates: {
    Widget2Attributes.ContentState.smiley
    Widget2Attributes.ContentState.starEyes
}
