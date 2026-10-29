import Component from "@glimmer/component";
import DefaultPostersCell from "discourse/components/topic-list/item/posters-cell";
import DUserLink from "discourse/ui-kit/d-user-link";
import dAvatar from "discourse/ui-kit/helpers/d-avatar";
import { isOpAuthorTopic, originalPoster } from "../lib/op-author";

export default class OpPostersCell extends Component {
  get useOp() {
    return isOpAuthorTopic(this.args.topic) && originalPoster(this.args.topic);
  }

  get poster() {
    return originalPoster(this.args.topic);
  }

  <template>
    {{#if this.useOp}}
      <td class="posters topic-list-data">
        <DUserLink
          @username={{this.poster.user.username}}
          @href={{this.poster.user.path}}
          class={{this.poster.extraClasses}}
        >
          {{dAvatar
            this.poster
            avatarTemplatePath="user.avatar_template"
            usernamePath="user.username"
            namePath="user.name"
            imageSize="small"
          }}
        </DUserLink>
      </td>
    {{else}}
      <DefaultPostersCell @topic={{@topic}} />
    {{/if}}
  </template>
}
