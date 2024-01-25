require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4436.0.0-darwin-x64.tar.gz"
    sha256 "ea2920fe4bcc2ae15c2898bf44301376977925badb09a2bf6d89279da420a5ce"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4436.0.0-darwin-arm64.tar.gz"
      sha256 "e33c8424cc2ef70ca0e10367f99c3c0fc206a4e432e6de2682dec1b57f53cc1f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4436.0.0-linux-x64.tar.gz"
    sha256 "98124d062394d8ce3aba9b3a20c03a8d355ca1d6846523ee13184a19d9e2ed51"
  end
  version "4436.0.0"
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
