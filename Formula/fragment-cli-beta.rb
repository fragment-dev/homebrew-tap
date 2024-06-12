require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5262.0.0-darwin-x64.tar.gz"
    sha256 "e4dd938cd2958dd6c96ad698fb2f19fed0c6288d4c4afad8bac4814147778a7f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5262.0.0-darwin-arm64.tar.gz"
      sha256 "7a8e613517d7bbc7d1cbea7020fcba9b9d0d6ec31fd515d5ee0d88d932adfe87"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5262.0.0-linux-x64.tar.gz"
    sha256 "9ee078e84ed43ebc2f7f22714b1e7fdd5729e538d439e2a2aff4d0863e0c9049"
  end
  version "5262.0.0"
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
