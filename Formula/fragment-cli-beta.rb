require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3107.0.0-darwin-x64.tar.gz"
    sha256 "b3d7e11c5230c8b7424f26e97ffe9773a48cdd699f43761d81858b17595020b4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3107.0.0-darwin-arm64.tar.gz"
      sha256 "4c918b491a1de7dabc97e3a6e1ddfaef7feeffdef2118f664b14d8e6ad3f4814"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3107.0.0-linux-x64.tar.gz"
    sha256 "ccf65daadc06b31680344de04cb73eee109067cc3118fb148b22c3014ad9b5d8"
  end
  version "3107.0.0"
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
