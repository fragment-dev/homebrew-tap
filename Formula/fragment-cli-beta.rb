require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5730.0.0-darwin-x64.tar.gz"
    sha256 "7fc16965a44f9d45ffeaf5139d689a6e7393f39eaf2f579421d704a6f7249b9f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5730.0.0-darwin-arm64.tar.gz"
      sha256 "e08d122beade54b90831959bebec9eb2e34fe7b2c83de6d1cea0fe33a12b7b36"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5730.0.0-linux-x64.tar.gz"
    sha256 "50efefcfc237377c362dfea2affb5fa917a2b62233404e2eb27e47c8abf0e002"
  end
  version "5730.0.0"
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
