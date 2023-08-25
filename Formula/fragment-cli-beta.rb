require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3393.0.0-darwin-x64.tar.gz"
    sha256 "9880ab33c8e22e0a084321539655391f5f03d2ad610e01d8044fd094ffc0d762"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3393.0.0-darwin-arm64.tar.gz"
      sha256 "054fbe79f6ce2efee9c693c9346fa51222b22f4541a582644e0f1f5370344704"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3393.0.0-linux-x64.tar.gz"
    sha256 "c60bbe0024a506b434dc4a5f103d5c09261df5c3266d04e355b37d071bd379d3"
  end
  version "3393.0.0"
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
