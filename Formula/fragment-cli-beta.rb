require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3024.0.0-darwin-x64.tar.gz"
    sha256 "e574c6a44d7da1cf57131de1fad1b33cae998389bb3431debb1deb8f68b31bed"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3024.0.0-darwin-arm64.tar.gz"
      sha256 "e0a0172b61dc03b53b72a82d4bcf83c066dfbd390da3d4b50ea0dae89596b270"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3024.0.0-linux-x64.tar.gz"
    sha256 "88ccc6fd2679ad8c0004b23ec9e192718f478075865db8ffd7990e072f8f483d"
  end
  version "3024.0.0"
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
