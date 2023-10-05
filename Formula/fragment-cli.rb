require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.5-darwin-x64.tar.gz"
    sha256 "235e342d40f28c5fd760baa8901028ee5ffb6cba57f7f0c32968fb6f07c85ac5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.5-darwin-arm64.tar.gz"
      sha256 "ee5527cdfc290552c8957e3c35b168e2145cbdb203dd2f1b20652dd9596dddcc"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.5-linux-x64.tar.gz"
    sha256 "81641cf674ff147982784ed25c20c2f15d7922a08d81bfac2b48028faf0b61ac"
  end
  version "2023.10.5"
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
