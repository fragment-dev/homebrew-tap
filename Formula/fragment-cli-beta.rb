require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6139.0.0-darwin-x64.tar.gz"
    sha256 "3d7be984c3a56d63d5a4c9e1802b165692fbb90d5ad6332b83ed0de9f9781785"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6139.0.0-darwin-arm64.tar.gz"
      sha256 "373c3fa37795f6363bb50132086aea747c25097acc03d2be7857cb9f1020e63f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6139.0.0-linux-x64.tar.gz"
    sha256 "d79f8faec80dd4ea9a83bd71ba5a93a16df8ab9da8ee9b3767143bcae3116de8"
  end
  version "6139.0.0"
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
