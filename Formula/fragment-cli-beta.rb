require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5449.0.0-darwin-x64.tar.gz"
    sha256 "51a71a4b04cdcb66e4fbdf70e6562d58ab377a079996aa6219b6c981f1345956"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5449.0.0-darwin-arm64.tar.gz"
      sha256 "0f4a53c66c4e8c43e2756edb8da8bd4b5fbd3524fdbd6361b0a1e79ec3e0abe2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5449.0.0-linux-x64.tar.gz"
    sha256 "c74d7651beff209b68d32fe32b0515283eba069a6533acc767a7dbc0cfacbb1f"
  end
  version "5449.0.0"
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
