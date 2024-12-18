require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5919.0.0-darwin-x64.tar.gz"
    sha256 "c3bf41623fb3fd89fefa764c79f37819570affe243dc34c724f5c05e96dd37f7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5919.0.0-darwin-arm64.tar.gz"
      sha256 "9fd056e187672ca7c89b3995f82c3eaa74174f1b9f560aae41a423e61fa6222f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5919.0.0-linux-x64.tar.gz"
    sha256 "3677841381da95f13da67b1e0b23ae0d471b621a184c87c1d7f1f8d997dce0ca"
  end
  version "5919.0.0"
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
