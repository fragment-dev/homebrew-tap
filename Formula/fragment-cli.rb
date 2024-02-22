require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.22-darwin-x64.tar.gz"
    sha256 "657c612b26ec4ecf90d5086727ce8c786abed64dcac9bfb2118fb00021b3e824"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.22-darwin-arm64.tar.gz"
      sha256 "56298ea96597a18c439360aafd4ee881fc416e689cf6fdeb229c701245d0bceb"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.22-linux-x64.tar.gz"
    sha256 "17db1187cde48ca1870b6e26c402977184cf96083798e49d5c05a6e4be410791"
  end
  version "2024.2.22"
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
