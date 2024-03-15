require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4771.0.0-darwin-x64.tar.gz"
    sha256 "57273627e99beffeecf4baa82956bbe946629b2194700f202ade5a2294dcf130"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4771.0.0-darwin-arm64.tar.gz"
      sha256 "97ee9eb7cfe6c852cd99e3e3ca42abb9cb4de277aebc4a48088e9c918a95813e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4771.0.0-linux-x64.tar.gz"
    sha256 "3ab3979b789f0723df1710ece8f500c54ef57fb479beb505a077d8ba97da815e"
  end
  version "4771.0.0"
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
