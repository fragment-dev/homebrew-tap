require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3998.0.0-darwin-x64.tar.gz"
    sha256 "308de47368dca02e5770b0181f2b4b6a31a62b7f0984cbfd6afb18c791001c23"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3998.0.0-darwin-arm64.tar.gz"
      sha256 "077440ff1f4b8ee945fcb5f89554dfd8c154e886acc901d48ae349ac95d8079e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3998.0.0-linux-x64.tar.gz"
    sha256 "9e632a950ea37a6e0478600803f608a69a5381a1d153796ecbfd08c3151bd949"
  end
  version "3998.0.0"
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
