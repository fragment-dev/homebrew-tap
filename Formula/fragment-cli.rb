require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.10-2-darwin-x64.tar.gz"
    sha256 "acc50281d9651da868b2200a32e5e126cd755a017d368ed2dc68cb35dce28bda"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.10-2-darwin-arm64.tar.gz"
      sha256 "936abdfcd332bfddab5f638cb5fd464fd18d8d7dce891f56dbe8a7ff833fe150"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.10-2-linux-x64.tar.gz"
    sha256 "cb5e480bca7f7099041f434fa4c205c8dcbc93a30066303e7ad09346c13136cd"
  end
  version "2024.12.10-2"
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
