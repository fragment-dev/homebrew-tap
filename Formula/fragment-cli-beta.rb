require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3900.0.0-darwin-x64.tar.gz"
    sha256 "13fc0a0b197416f714d26fe8ac59e1cdae0a930782161f83bc8f2fd1257cabc7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3900.0.0-darwin-arm64.tar.gz"
      sha256 "7412c8284c1c9d82614f1a467cc684f75dbf5fe8ac58d77ecd31afc065948ab4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3900.0.0-linux-x64.tar.gz"
    sha256 "f5d932b2be3d9741cf8beedec6f2e6cffa9d81cee206eacf44d9bbf0c591e9f2"
  end
  version "3900.0.0"
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
