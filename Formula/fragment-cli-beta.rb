require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4700.0.0-darwin-x64.tar.gz"
    sha256 "61df7dbce46cbfa685915c26c0eab30eef07ce34c88a326fbc4ef429dda73e8b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4700.0.0-darwin-arm64.tar.gz"
      sha256 "27bf25e00eb70adad6b52e21705455f3fb3a7920ade8100ed808a980cf612d99"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4700.0.0-linux-x64.tar.gz"
    sha256 "c84a3864ceed1e860596ed0bf01b251bd8beaa7991f2b252111df6e995286074"
  end
  version "4700.0.0"
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
