require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.9-1-darwin-x64.tar.gz"
    sha256 "da09fd087208947ca4ccdd52808864c5417a710826b858c26c01ea48d9292e2a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.9-1-darwin-arm64.tar.gz"
      sha256 "69af7ebb1fcda197a7c991dd6b02d7c5c8c1c08e3f7c28b32c57d30fc518e2ab"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.9-1-linux-x64.tar.gz"
    sha256 "d1ac9a75d83c0f800bf2aff0a9db438322b15949ebf67da967c97ec6764d4553"
  end
  version "2023.8.9-1"
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
