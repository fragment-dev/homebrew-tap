require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-1-darwin-x64.tar.gz"
    sha256 "2037ba07b5bb9dc9a2369d468b1093d6c037410235264663679eefd71eae9b06"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-1-darwin-arm64.tar.gz"
      sha256 "b33805914c517f99e54efebfffe17e7d3cc920c1b5bb5ed4fd86fd65f0bd6f3d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-1-linux-x64.tar.gz"
    sha256 "188d18fc9381b92274fd8299d3e96b261207f855be03aa8ac83b7f9a2e0b5dd0"
  end
  version "2024.12.24-1"
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
