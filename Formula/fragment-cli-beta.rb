require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3769.0.0-darwin-x64.tar.gz"
    sha256 "0c561e6b7e2b058bd7078256fe3d76e5489dad25896012aea617a3f37e5929eb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3769.0.0-darwin-arm64.tar.gz"
      sha256 "390401ab8268f587435b9d986ed176c60b436210213623fb844a165790593da9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3769.0.0-linux-x64.tar.gz"
    sha256 "c167122e7093aad3895ea30a6fa1114b9ae5b0ceb61057718d53909251cfb750"
  end
  version "3769.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
