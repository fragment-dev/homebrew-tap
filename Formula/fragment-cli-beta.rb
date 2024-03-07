require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4720.0.0-darwin-x64.tar.gz"
    sha256 "8d8ec3e3d07ee831841b7a0d3d04597f83afdcb2faf816c01413aa1c8d7cb5cd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4720.0.0-darwin-arm64.tar.gz"
      sha256 "4673593335320c8739861980232481d1f14113dc8ed3070ec9b55fecc793d2bc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4720.0.0-linux-x64.tar.gz"
    sha256 "6a159a8beda37d782e9483e9727d4a7f49af81d870dc33675066622779cb16a0"
  end
  version "4720.0.0"
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
