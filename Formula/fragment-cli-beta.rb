require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4530.0.0-darwin-x64.tar.gz"
    sha256 "e653765ac43a1c6b67d74283056c25842274c908380999e59ef55b4a8c8a3644"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4530.0.0-darwin-arm64.tar.gz"
      sha256 "0de72cd97814bd560ce2b7af4563055749bffa4777694fb524beddd75b0175cd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4530.0.0-linux-x64.tar.gz"
    sha256 "0a51aedf33db22ae65c110546c402f32beb161b68bf28bd878a6359a3df8d328"
  end
  version "4530.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
