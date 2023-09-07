require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3495.0.0-darwin-x64.tar.gz"
    sha256 "87bd6143348446d285a5ffafda668e9296f7fee55636db8246b3c0a4b9aa812e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3495.0.0-darwin-arm64.tar.gz"
      sha256 "06af0049a59ae93e02015e0d3c3f05a4d63e6c8fd323a6dac235e143b0e1e29d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3495.0.0-linux-x64.tar.gz"
    sha256 "8ac32db0e07e872cdd0b18da7c274f56d3554810397a56aff87a4046bdad47f5"
  end
  version "3495.0.0"
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
