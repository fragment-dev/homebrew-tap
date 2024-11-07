require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5747.0.0-darwin-x64.tar.gz"
    sha256 "242b032c02db3e5601865ba42c4320bc13218746912d9ec2805c1093e9aa8277"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5747.0.0-darwin-arm64.tar.gz"
      sha256 "abd1974884296eb159032c2d20bb4ee991bdc3ad42722d138617cf20d97f5977"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5747.0.0-linux-x64.tar.gz"
    sha256 "9dee8b6407413af5c60c6d975e16301bba2c6948df571a234d63616a18fd50bb"
  end
  version "5747.0.0"
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
