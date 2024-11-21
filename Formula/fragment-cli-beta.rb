require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5811.0.0-darwin-x64.tar.gz"
    sha256 "1c64737dd7fa8e4cd4a6870621be96e14abf58908f695f66062cb63629098aa3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5811.0.0-darwin-arm64.tar.gz"
      sha256 "488d3cdafd11f3868f59ef66245bee60c9f3f2247585aab87862e1d8ed9c5a0b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5811.0.0-linux-x64.tar.gz"
    sha256 "b4b095eb5d701377a23abd33b0312249d9ce83a52894ab056447bfeff09794bb"
  end
  version "5811.0.0"
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
