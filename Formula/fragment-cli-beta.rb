require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4616.0.0-darwin-x64.tar.gz"
    sha256 "2af2ddfbb1f14c2488785360434bce2f2fe7c61c8f057d96722bc84f96776b96"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4616.0.0-darwin-arm64.tar.gz"
      sha256 "7a4a9379e69ead05b7befd5ad9606ab38daa060f6a2512be8cae9d19586020ec"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4616.0.0-linux-x64.tar.gz"
    sha256 "0692f14438c6d8ea6514669aa641410c3c2168135116fbda375e7b373f58ba02"
  end
  version "4616.0.0"
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
