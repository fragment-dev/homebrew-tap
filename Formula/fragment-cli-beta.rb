require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5004.0.0-darwin-x64.tar.gz"
    sha256 "a0d7c9ac366262cfcb254baee0975572479031792d05e2f8fb12f9d63e03305f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5004.0.0-darwin-arm64.tar.gz"
      sha256 "61786ce3d8f483d7975b767defa96b03ab626cfebe3d3e7bd428eb7689f95cd3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5004.0.0-linux-x64.tar.gz"
    sha256 "468eeb7d57df7746cc2318a8129fe8b8acb2d4fe9bd1598dc8f961bcf2281968"
  end
  version "5004.0.0"
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
