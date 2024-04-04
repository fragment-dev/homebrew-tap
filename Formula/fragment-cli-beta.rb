require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4849.0.0-darwin-x64.tar.gz"
    sha256 "c1331e0e7bdcdc830cf4e876fc8895276a7b7f8ffcef4ec790516e0d099efced"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4849.0.0-darwin-arm64.tar.gz"
      sha256 "1960afb8c4f8aca8a8cb66e9f04eeb3ff59b46539a0464d6d8f8a850f9845708"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4849.0.0-linux-x64.tar.gz"
    sha256 "2c370c75df8fc0fa11c2b89060cea9dca4283bcf0972327c2923fa045ff59a4a"
  end
  version "4849.0.0"
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
