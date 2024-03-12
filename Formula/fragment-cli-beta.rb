require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4754.0.0-darwin-x64.tar.gz"
    sha256 "684b841220738f9a54ff4416162fa5b1c0d732f5a3800ab105ebcca5694ee58f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4754.0.0-darwin-arm64.tar.gz"
      sha256 "e5e409787ccfbddde09d4d139f9c24d5b4900273fef1389c617c365575549d68"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4754.0.0-linux-x64.tar.gz"
    sha256 "973989f3727e44be1a36f607990e0ef9da9ce4761bf32da5292db7d1bb60c944"
  end
  version "4754.0.0"
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
