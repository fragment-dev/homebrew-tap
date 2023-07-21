require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3142.0.0-darwin-x64.tar.gz"
    sha256 "c67d56af280217ab726b6c1d4198659c83b414efaff60caf3bb9ac631eae562a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3142.0.0-darwin-arm64.tar.gz"
      sha256 "e6edfb53aa3bcde868302730f083977a5e387b39cc37b98999a58206dca973ef"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3142.0.0-linux-x64.tar.gz"
    sha256 "3c9ebc8b0a256c7725f388c22072928d75c2f58bcbbb73057e3aba41e5cfc27f"
  end
  version "3142.0.0"
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
