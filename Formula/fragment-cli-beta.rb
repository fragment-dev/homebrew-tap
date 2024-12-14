require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5898.0.0-darwin-x64.tar.gz"
    sha256 "d58ca5feb171394a090acb38a73a65711b65808ee23bae61cbd5743da6ec28f7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5898.0.0-darwin-arm64.tar.gz"
      sha256 "5088f8c42b77428762a37bb198f9c65275408252e7ea8d1cf9625146d110fe62"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5898.0.0-linux-x64.tar.gz"
    sha256 "c3763b05a4214f59f4e4883076ff0e67efb2ac85504c3950625338ed018688c8"
  end
  version "5898.0.0"
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
