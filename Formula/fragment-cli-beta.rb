require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5589.0.0-darwin-x64.tar.gz"
    sha256 "ace7fbedb09cb318a1140c9fe2c3c43f7fec301cd5d23226e85087881d260345"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5589.0.0-darwin-arm64.tar.gz"
      sha256 "188d66da7d4a52ee27047e2135ec48e0a00fd57d6b2ff0f83b8f3583cedd7479"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5589.0.0-linux-x64.tar.gz"
    sha256 "7685183c178c19f636306764945cad900d07be21fb901377ffe6f0a5e4b2af7d"
  end
  version "5589.0.0"
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
