require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4386.0.0-darwin-x64.tar.gz"
    sha256 "3c5d164de0a5922cec6a16bf73d29f4fc4d201515982f91115fde3650201ce25"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4386.0.0-darwin-arm64.tar.gz"
      sha256 "3da835e2752424644bd93734bba911ead7de357c0cc786fb12f81c86f498d839"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4386.0.0-linux-x64.tar.gz"
    sha256 "05bab690cad5560cfdef1d91d81cef73085b25833ab8d045b9cdfda465ee6ba4"
  end
  version "4386.0.0"
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
