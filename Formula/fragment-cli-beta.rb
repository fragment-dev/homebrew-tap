require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5353.0.0-darwin-x64.tar.gz"
    sha256 "22299a32a66da5602ab2576a4b9ac213da67b8a651521055457f18019833dc29"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5353.0.0-darwin-arm64.tar.gz"
      sha256 "f969323f0e89910fa8b78d4924867eca348eef754ff67da1ddfa64f206213010"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5353.0.0-linux-x64.tar.gz"
    sha256 "4f975eeafd628655f0112af91986ff6eb1a3d211f8400b33ba65b8771b5b4618"
  end
  version "5353.0.0"
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
