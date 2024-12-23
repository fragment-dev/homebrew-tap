require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5971.0.0-darwin-x64.tar.gz"
    sha256 "cb1caaeb21215a56ee581670bc2325178dfd452fa03fbb0d95487c9ed44d97b8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5971.0.0-darwin-arm64.tar.gz"
      sha256 "5ac250b527bd8d27dddf8a42f9b41578fc983047ff84cf4920326061d344218a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5971.0.0-linux-x64.tar.gz"
    sha256 "19881318b872a677fff68271e16bef84ca29c4a6fd9ae9798db947aee6fbd3c9"
  end
  version "5971.0.0"
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
