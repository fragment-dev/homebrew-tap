require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3337.0.0-darwin-x64.tar.gz"
    sha256 "25ba1a9506a75893867b713c458d60c20609bd31bd24027780e05a5551119a0e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3337.0.0-darwin-arm64.tar.gz"
      sha256 "b63eee57b01922dbf5494acf4dd940950d5426f7c869f366a63b1193c3af169c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3337.0.0-linux-x64.tar.gz"
    sha256 "0239bd5375a865daeb040dd86460c8cced72a0b99b6e827c261e23c6fa412d91"
  end
  version "3337.0.0"
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
