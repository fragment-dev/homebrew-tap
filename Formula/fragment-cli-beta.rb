require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3969.0.0-darwin-x64.tar.gz"
    sha256 "a170a276c296b00a51edf4a7e0c9f1e143cced1945ae582ee179ed107c94c522"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3969.0.0-darwin-arm64.tar.gz"
      sha256 "6ef97d941413ee792ce75f1c3c3c735ae861fd5df3498c26403e682ea097841b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3969.0.0-linux-x64.tar.gz"
    sha256 "969b5514c8aaa58b0937ae1afd6a4121dbf1af6156c3b462b0f56ef1718dc2c9"
  end
  version "3969.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
