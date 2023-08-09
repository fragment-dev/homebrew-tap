require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3265.0.0-darwin-x64.tar.gz"
    sha256 "39dda2e87dff85cb5af02898f9e310e521d6b51939d75f7b1965f6e56b876405"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3265.0.0-darwin-arm64.tar.gz"
      sha256 "fab599b136299f692af12f3bd13c1621bdf43a58dec10f5464b4e703599b1535"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3265.0.0-linux-x64.tar.gz"
    sha256 "323f81d90c9e14dca41516544043cbf623763d35c6be06d6acc2c45c5deac9dd"
  end
  version "3265.0.0"
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
