require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5961.0.0-darwin-x64.tar.gz"
    sha256 "875c44c824f3a1e0bae1dcdf241fc1d67166f0362162cad79ffa1707e5ef8c9b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5961.0.0-darwin-arm64.tar.gz"
      sha256 "ad98619f5cf12bdbd608f987a85d5f0e13205232b89f43ffda1d1c7c72e1d625"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5961.0.0-linux-x64.tar.gz"
    sha256 "ae229f996d4e692980f055b4eafa291120c6580d3d2edbc857f0c8d49d8eeb16"
  end
  version "5961.0.0"
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
