require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3139.0.0-darwin-x64.tar.gz"
    sha256 "042b9c74addcf045ba801ffe51f5c6c479817c3074a71a2b6411409b87d218db"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3139.0.0-darwin-arm64.tar.gz"
      sha256 "c8533a24c0a18303e33d5a79be1dad6d4ec6d1aa35a9b8bae2cd196f25be49f1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3139.0.0-linux-x64.tar.gz"
    sha256 "276794bcee349e43a47c9bdab81567765f4a351525c9f776a6572d7eecd2deb5"
  end
  version "3139.0.0"
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
