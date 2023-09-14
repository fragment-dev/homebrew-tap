require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3562.0.0-darwin-x64.tar.gz"
    sha256 "98d57b674233854df27a64df00c840c7a59ea03a5e2625254297268eaa809d48"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3562.0.0-darwin-arm64.tar.gz"
      sha256 "fced583117164f33c344c0252081c90575a326aa745a662778ea6c09d746b6b4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3562.0.0-linux-x64.tar.gz"
    sha256 "4cdfb8e9dc2e3d3d2bf7df12053b0677070d851e30302f8d2bc20cce3818697f"
  end
  version "3562.0.0"
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
