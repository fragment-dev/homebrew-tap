require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4522.0.0-darwin-x64.tar.gz"
    sha256 "8c301ad0e187801aabf9ae01f7c3877cde39dce3f3252fe28f49861f5ec5b4d1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4522.0.0-darwin-arm64.tar.gz"
      sha256 "5177b13c17ebd8ea095bbe2871f0b67e488b986acc36fa6d8cebc8187faaa3ac"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4522.0.0-linux-x64.tar.gz"
    sha256 "5e998029910c6b4f372304c69d5550f40f832ac84ca0c3cab606bc3321ccdae7"
  end
  version "4522.0.0"
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
