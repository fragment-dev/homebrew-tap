require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2825.0.0-darwin-x64.tar.gz"
    sha256 "596b614d0659e777bce09c1ca4bfe6368587a939cafdd1ae0bf7cd0d6611d7ab"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2825.0.0-darwin-arm64.tar.gz"
      sha256 "eb70b4f32d1a705b84ce114e3f004341b252bf8d0decc0f57503cc06c6706ba2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2825.0.0-linux-x64.tar.gz"
    sha256 "f3f57d2e7cbca73ed4cb3bba716428434d95572cc6cbf41b6e6eb1c1573b981e"
  end
  version "2825.0.0"
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
