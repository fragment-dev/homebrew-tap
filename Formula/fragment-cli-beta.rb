require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2776.0.0-darwin-x64.tar.gz"
    sha256 "c11708a3600cf604889454b77f6f6e9a1746eb56107b9ed0c88d455e8682301a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2776.0.0-darwin-arm64.tar.gz"
      sha256 "17ca2f1c9e1dc6c0ddb97b9254f91776bcbc6dbdb8f262c10a5e0a4376a352a3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2776.0.0-linux-x64.tar.gz"
    sha256 "13c45b75b8b99e2bd3d7869f1e99126904250cc3706bc5649a9c2b048cd06610"
  end
  version "2776.0.0"
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
