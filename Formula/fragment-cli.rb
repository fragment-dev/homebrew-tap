require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.21-darwin-x64.tar.gz"
    sha256 "11ed68d1a40aec13033b42773c626deaafb31478f6be121764c62dbc54892139"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.21-darwin-arm64.tar.gz"
      sha256 "126134bebfc81b0733f42bdf64a0b9ef50c8f081d7b192f976428e9868b5dd7a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.21-linux-x64.tar.gz"
    sha256 "f9a75a18392f7f78a6770c076da16c42c02ab954a17c774a900009843e56d906"
  end
  version "2023.3.21"
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
