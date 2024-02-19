require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4587.0.0-darwin-x64.tar.gz"
    sha256 "ea71cda7fd7b9b6bfe76136e7c9833e611093a1a1916fa6a54094f38ba0a3af1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4587.0.0-darwin-arm64.tar.gz"
      sha256 "4072d584dfc87945fc356a69c4b1175d30990951df85c82daec51dfc365829cb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4587.0.0-linux-x64.tar.gz"
    sha256 "f9eac8ca7c167b35d676f88af6b33326852518502dc21ea202feba8539b62d3f"
  end
  version "4587.0.0"
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
