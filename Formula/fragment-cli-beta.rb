require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2321.0.0-darwin-x64.tar.gz"
    sha256 "650d29c1205fabb4892c9aa65451ba210fab4870ec0bfd50077fa33223f5a455"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2321.0.0-darwin-arm64.tar.gz"
      sha256 "6f900523813bb7798b58942b8c954e014ab6e163a6695ce326b354b17fc43f61"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2321.0.0-linux-x64.tar.gz"
    sha256 "1aad615ce5cd0c329c691d2065f1a3eb0985a96433972a049ba6ed01569e44f9"
  end
  version "2321.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
