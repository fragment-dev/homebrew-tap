require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2689.0.0-darwin-x64.tar.gz"
    sha256 "b84e6e5f68793ea782fd09802128e2e71dc10222b5dc5b955bfb47f9fecb2c39"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2689.0.0-darwin-arm64.tar.gz"
      sha256 "c4c3019acfdc8d63b7c3dc8e9d0a98727fca68870a862232dd25e9779937eb0a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2689.0.0-linux-x64.tar.gz"
    sha256 "dbbb1c9c21f7e7ee12b3f03626ca6e9fb4e3611cdda2726297b2388ab7bbe93e"
  end
  version "2689.0.0"
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
