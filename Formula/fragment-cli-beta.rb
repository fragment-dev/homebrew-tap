require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5597.0.0-darwin-x64.tar.gz"
    sha256 "f010ee6c8ae22cb5806be4aa162a628da9fa862fbd749b4a484ad069badc5b7a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5597.0.0-darwin-arm64.tar.gz"
      sha256 "e0290148727c7c43cc4d61e9395fa3d9a94f9ef9329bbe055252559cd2a5738c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5597.0.0-linux-x64.tar.gz"
    sha256 "6a73adccf35b6b45cdf3ce45d795f4557d3e92622a7116361f1e4a0c34e2446d"
  end
  version "5597.0.0"
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
