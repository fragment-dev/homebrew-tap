require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2250.0.0-darwin-x64.tar.gz"
    sha256 "06f5d4ada621920a1c1ce1ca7684fb7f1ab684a379161dcf4b3724565e987048"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2250.0.0-darwin-arm64.tar.gz"
      sha256 "ff9e891678c20d19ccc4839b05a759201cbeaccdbbcd76e2a7e59e8d2c8ce50f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2250.0.0-linux-x64.tar.gz"
    sha256 "5866d84490544156624c6bf14b265149bb5174c11290bdd11f569b2ac7fae349"
  end
  version "2250.0.0"
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
