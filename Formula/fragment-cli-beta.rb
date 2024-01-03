require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4261.0.0-darwin-x64.tar.gz"
    sha256 "762996af293484959a255cea68f4eac2efc934f65dfdd277da9cba6fbfcafaff"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4261.0.0-darwin-arm64.tar.gz"
      sha256 "3f9a1d3e2ae7cb748795cc6dee688da6b8b4a9f9caa38ae5d9720d8e19e9bd7f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4261.0.0-linux-x64.tar.gz"
    sha256 "63112521312e4919f1c72d3f825db518d9a0c511689d2ca320ceaebab91d9e96"
  end
  version "4261.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
