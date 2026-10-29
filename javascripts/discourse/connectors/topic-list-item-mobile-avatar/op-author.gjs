import Component from "@glimmer/component";
import DUserLink from "discourse/ui-kit/d-user-link";
import dAvatar from "discourse/ui-kit/helpers/d-avatar";
import { isOpAuthorTopic } from "../../lib/op-author";

export default class OpAuthorMobileAvatar extends Component {
  static shouldRender(args) {
    return isOpAuthorTopic(args.topic) && !!args.topic.creator;
  }

  <template>
    <DUserLink @username={{@outletArgs.topic.creator.username}}>
      {{dAvatar @outletArgs.topic.creator imageSize="large"}}
    </DUserLink>
  </template>
}
