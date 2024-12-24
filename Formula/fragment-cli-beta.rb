require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5986.0.0-darwin-x64.tar.gz"
    sha256 "0e7be9ecee3a2130da565b8e5d3864b94bec5f085e1190a51d7c317776210e35"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5986.0.0-darwin-arm64.tar.gz"
      sha256 "39d31ae8526c76b99bbf3184a422dcd2558cd8af7caebff501a429748e24348a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5986.0.0-linux-x64.tar.gz"
    sha256 "ca5286f6e1ffaf311583a4f8739bc5e2afbbec51cb4b9922aca4dcca1c361fc4"
  end
  version "5986.0.0"
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
