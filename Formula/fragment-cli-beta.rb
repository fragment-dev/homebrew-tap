require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2970.0.0-darwin-x64.tar.gz"
    sha256 "54a544c248bc5f0dee31169ac92219f9d560f08a4a981c090301c754c218d94e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2970.0.0-darwin-arm64.tar.gz"
      sha256 "ccd215e2398f49b43d5000d73e6afc94d83c32eb3171ecb85a9a79e7d29aed7a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2970.0.0-linux-x64.tar.gz"
    sha256 "3685c3b6d3e8cd13102139d1906ecaff9b0278fc746ec767cbcbc827b2b29096"
  end
  version "2970.0.0"
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
